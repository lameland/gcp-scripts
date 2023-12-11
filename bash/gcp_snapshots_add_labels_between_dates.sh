#!/bin/bash

if [ "$#" -ne 3 ]; 
then
    >&2 echo "No arguments provided"
    >&2 echo "Usage: gcp_snapshots_add_labels_between_dates.sh [start-date-utc] [end-date-utc] [label-key=label-value]"
    >&2 echo "Example: gcp_snapshots_add_labels_between_dates.sh \"2023-01-01\" \"2023-02-01"\ \"component=disk-snapshot\""
    exit 1
fi

start_date=$1
end_date=$2

snapshots=`gcloud compute snapshots list --format="value(name)" --filter="creationTimestamp>='${start_date}' AND creationTimestamp<='${end_date}'"`

for snapshot in $snapshots; 
do 
    gcloud compute snapshots add-labels "${snapshot}" --labels="$3"