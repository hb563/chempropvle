## Local run
# python save_wandb.py --data_path /c/Users/hashi/vle_prediction/nbs/data/aspen_ac/postprocess/train_aspen_data.csv --features_path /c/Users/hashi/vle_prediction/nbs/data/aspen_ac/postprocess/train_aspen_features.csv --checkpoint_frzn /c/Users/hashi/vle_prediction/results/pretrained_gammas/model.pt --split_sizes 0.9 0.09 0.01 --dataset_type regression --save_dir /c/Users/hashi/vle_prediction/results/aspen/activity_coeff/test_vle --smiles_columns smiles_1 smiles_2 --target_columns ln_gamma_1 ln_gamma_2 --number_of_molecules 2 --ffn_hidden_size 300 --batch_size 20 --epochs 5 --num_workers 1 --metric mse --extra_metrics r2 mae --molefrac_weights --molfrac_weights_path /c/Users/hashi/vle_prediction/nbs/data/aspen_ac/postprocess/train_mole_fractions.csv $1 $2

## Grid run
# grid run --instance_type g4dn.xlarge --ignore_warnings --dependency_file requirements.txt ./aspen_gammas.sh --datastore_path grid:aspen_all_sets:3 --experiment_name aspen_g1  

## For req.txt file
# git+https://github.com/hb563/chempropvle.git

wandb login b04c963cb59d36b7ca344a11fd9da461ec1a9cce

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


#### LOCAL RUN using $@
# --dataset_type regression --data_path train_data.csv --features_path train_all_features.csv --save_preds --show_individual_scores \--extra_metrics r2 mae mse --target_columns ln_gamma_1 ln_gamma_2 --smiles_columns smiles_1 smiles_2 --separate_test_path test_data.csv --separate_test_features_path test_all_features.csv --separate_val_path val_data.csv --separate_val_features_path val_all_features.csv --epochs 30 --cache_cutoff 1e9 --batch_size 1000 --metric mse 


#### GRID RUN using $@
# grid run --localdir --instance_type g4dn.xlarge --ignore_warnings ./aspen_gammas.sh --data_path grid:aspen_all_sets:2 --dataset_type regression --data_path train_data.csv --features_path train_all_features.csv --save_preds --show_individual_scores \--extra_metrics r2 mae mse --target_columns ln_gamma_1 ln_gamma_2 --smiles_columns smiles_1 smiles_2 --separate_test_path test_data.csv --separate_test_features_path test_all_features.csv --separate_val_path val_data.csv --separate_val_features_path val_all_features.csv --epochs 30 --cache_cutoff 1e9 --batch_size 1000 --metric mse --experiment_name aspen-gammas1
