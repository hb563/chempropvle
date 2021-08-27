## Local run

## Grid run
# grid run --instance_type g4dn.xlarge --ignore_warnings --dependency_file requirements.txt ./aspen_gammas.sh --datastore_path grid:aspen_all_sets:3 --experiment_name aspen_g1  

## For req.txt file
# git+https://github.com/hb563/chempropvle.git

wandb login fkdlsie483875029384jjfklsi
            
# python chempropvle.chemprop.train.cross_validate
#ARGS=("$@")
python save_wandb.py \
    --dataset_type regression \
    --data_path "$2"/train_data.csv \
    --number_of_molecules 2 \
    --features_path "$2"/train_all_features.csv \
    --save_preds \
    --show_individual_scores \
    --extra_metrics r2 mae mse \
    --target_columns ln_gamma_1 ln_gamma_2 \
    --smiles_columns smiles_1 smiles_2 \
    --separate_test_path "$2"/test_data.csv \
    --separate_test_features_path "$2"/test_all_features.csv \
    --separate_val_path "$2"/val_data.csv \
    --separate_val_features_path "$2"/val_all_features.csv \
    --epochs 30 \
    --cache_cutoff 1e9 \
    --batch_size 1000 \
    $3 $4



#     --metric mse \
#     --dataset_type regression \
#     --data_path train_data.csv \
#     --features_path train_all_features.csv \
#     --save_preds \
#     --show_individual_scores \ 
#     --extra_metrics r2 mae mse \
#     --target_columns ln_gamma_1 ln_gamma_2 \
#     --smiles_columns smiles_1 smiles_2 \
#     --separate_test_path test_data.csv \
#     --separate_test_features_path test_all_features.csv \
#     --separate_val_path val_data.csv \
#     --separate_val_features_path val_all_features.csv \
#     --epochs 30 \
#     --cache_cutoff 1e9 \
#     --batch_size 1000 \
#     --metric mse \

# 	--init_lr 0.000001 \
# 	--max_lr 0.00001 \
# 	--final_lr 0.000001 \
# 	--dropout 0.2 \
# 	--num_workers  \

# 	--save_dir  \
# 	--mpn_shared  \
#     --split_sizes 0.95 0.05 0.0 --split_type random
# 	--molefrac_weights  \
# 	--molfrac_weights_path  \
# 	--use_molfrac_as_target_weights  \
# 	--target_weights_path  \
# 	--use_molfrac_as_target_and_mpn  \
