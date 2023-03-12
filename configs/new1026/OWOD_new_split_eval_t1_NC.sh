#!/bin/bash


EXP_DIR=exps/OWOD_t1_ore_w_nc
PY_ARGS=${@:1}

for((i=54;i<75;i+=5));  
do
#i=69
x=`expr $i + 1`
python -u main_open_world.py \
    --output_dir ${EXP_DIR} --data_root './data/OWOD' --dataset owod --num_queries 100 --eval_every 5 \
    --PREV_INTRODUCED_CLS 0 --CUR_INTRODUCED_CLS 20 --train_set 't1_train' --test_set 'all_task_test' --num_classes 81 \
    --unmatched_boxes --top_unk 5 --NC_branch --nc_loss_coef 0.1 --nc_epoch 9 \
    --epochs $x --featdim 1024  \
    --backbone 'dino_resnet50' \
    --resume 'exps/OWOD_t1_ore_w_nc/checkpoint00'$i'.pth' --eval \
    ${PY_ARGS}

sleep 1m

done
