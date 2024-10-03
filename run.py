import os
import sys
import argparse
import wandb

os.environ["WANDB_API_KEY"] = "REPLACE_WITH_YOUR_WANDB_API_KEY"
os.environ['WANDB_START_METHOD'] = 'thread'
parser = argparse.ArgumentParser(description='wandb-slurm')

def main():
    # args = parser.parse_args()
    with wandb.init(config=None):
    # with wandb.init(config=args):
        args = wandb.config

        # torch.autograd.set_detect_anomaly(True)
        torch.manual_seed(args.seed)
        torch.cuda.manual_seed(args.seed)
        np.random.seed(args.seed)
        random.seed(args.seed)
        if args.dataset_name == 'MNIST':
            pass
            wandb.log({"ba": ba, "acc": acc})
            report = sklearn.metrics.classification_report(y_true, y_pred, target_names=[str(i) for i in np.unique(y_true)],
                                                   output_dict=True)
            wandb.log({"conf_mat": wandb.plot.confusion_matrix(probs=None,
                                                       y_true=y_true, preds=y_pred,
                                                       class_names=[str(i) for i in np.unique(y_true)])})
            wandb.log(report)


if __name__ == "__main__":
    main()
