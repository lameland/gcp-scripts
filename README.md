# gcp-scripts
Scripts for managing GCP resources

## gcp_snapshots_add_labels_between_dates.sh

Script to add labels to Compute Disk Snapshots created between 2 dates

Usage: 
```sh
gcp_snapshots_add_labels_between_dates.sh [start-date-utc] [end-date-utc] [label-key=label-value]
```
Example: 
```sh 
gcp_snapshots_add_labels_between_dates.sh [2023-01-01] [2023-02-01] [component=disk-snapshot]
```