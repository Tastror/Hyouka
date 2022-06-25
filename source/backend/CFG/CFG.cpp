//
// Created by Simon on 2022/6/2.
// Tastror, 6.13
//

#include "CFG.h"
#include <algorithm>


CFG_builder::CFG_builder(const std::shared_ptr<IR_node>& IR_head) {
    this->IR_head = IR_head;
    basic_block_num = 0;
}

void CFG_builder::Generate() {
    init();
    first_generate();
    second_generate();
}

void CFG_builder::init() {
    IR_PTR temp = IR_head;
    if (temp != nullptr) temp = temp->next;
    int i = 0;
    while (temp != nullptr) {
        IR_chain.push_back(temp);
        if (temp->ir_type == ir_label) {
            auto map_member = std::make_pair(temp->target.name, i);
            IR_maps.insert(map_member);
        }
        temp = temp->next;
        ++i;
    }
}

void CFG_builder::first_generate() {
    bool delay = false;
    bool remember = false;
    bool new_jump = false;
    int index = 0;
    for (const auto& i : IR_chain) {

        if (i->ir_type == ir_label || delay) {
            create_new_block(i, index);
            if (!delay && last_CFG != nullptr)
                last_CFG->str_successor.push_back(now_CFG->name);
            if (!new_jump && last_CFG != nullptr) {
                add_last_to_now();
            }
            new_jump = false;
            delay = false;
        }

        if (remember) {
            remember = false;
            add_last_to_now();
            last_CFG->str_successor.push_back(now_CFG->name);
        }

        // call will not make it apart

        if (i->opera == "jump" || i->opera == "jumpr") {
            delay = true;
            new_jump = true;
            add_successor_to_now(i->target.name);
        }

        if (i->opera == "jumpe" ||  i->opera == "jumpn" || i->opera == "jumper" ||  i->opera == "jumpnr") {
            delay = true;
            remember = true;
            add_successor_to_now(i->target.name);
        }

        add_to_now(i);
        index++;
    }
}

void CFG_builder::second_generate() {
    for (const auto& mem : CFG_blocks_chain) {
        for (const auto& i : mem->str_predecessor) {
            auto res = IR_maps.find(i);
            if (res != IR_maps.end()) {
                IR_PTR ir = IR_chain[res->second];
                auto res2 = CFG_maps.find(ir);
                if (res2 != CFG_maps.end())
                    mem->predecessor.push_back(res2->second);
                else
                    CFG_safe::RaiseError("CFG_maps.find(ir) can not find");
            } else {
                if (i != "$ra")
                    CFG_safe::RaiseWarning("using undefined function");
            }
        }

        for (const auto& i : mem->str_successor) {
            auto res = IR_maps.find(i);
            if (res != IR_maps.end()) {
                IR_PTR ir = IR_chain[res->second];
                auto res2 = CFG_maps.find(ir);
                if (res2 != CFG_maps.end())
                    mem->successor.push_back(res2->second);
                else
                    CFG_safe::RaiseError("CFG_maps.find(ir) can not find");
            } else {
                if (i != "$ra")
                    CFG_safe::RaiseWarning("using undefined function");
            }
        }
    }
}

void CFG_builder::create_new_block(const IR_PTR& connect_IR, int ir_index) {
    last_CFG = now_CFG;
    now_CFG = std::make_shared<CFG_node>();
    now_CFG->index = basic_block_num;
    if (connect_IR->ir_type == ir_label)
        now_CFG->name = connect_IR->target.name;
    else {
        now_CFG->name = "CFG_block_" + std::to_string(basic_block_num);
        auto map_member = std::make_pair(now_CFG->name, ir_index);
        IR_maps.insert(map_member);
    }
    CFG_blocks_chain.push_back(now_CFG);
    basic_block_num++;
    auto map_member = std::make_pair(connect_IR, now_CFG);
    CFG_maps.insert(map_member);
}

void CFG_builder::add_to_now(const IR_PTR& now_IR) {
    now_CFG->content.push_back(now_IR);
}

void CFG_builder::add_last_to_now() {
    now_CFG->str_predecessor.push_back(last_CFG->name);
}

void CFG_builder::add_predecessor_to_now(const std::string& CFG_str) {
    now_CFG->str_predecessor.push_back(CFG_str);
}

void CFG_builder::add_successor_to_now(const std::string& CFG_str) {
    now_CFG->str_successor.push_back(CFG_str);
}