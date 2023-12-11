#!/bin/bash

if [ "$#" -lt 2 ]; 
then
    >&2 echo "No arguments provided"
    >&2 echo "Usage: gcp_snapshots_delete_between_dates.sh [start-date-utc] [end-date-utc] Optional: [labels.label-key=label-value]"
    >&2 echo "Example: gcp_snapshots_delete_between_dates.sh \"2023-01-01\" \"2023-02-01\""
    >&2 echo "Example - filtering including label: gcp_snapshots_delete_between_dates.sh \"2023-01-01\" \"2023-02-01\" \"labels.environment=uat\""
    >&2 echo "Example - filtering excluding label: gcp_snapshots_delete_between_dates.sh \"2023-01-01\" \"2023-02-01\" \"-labels.environment=uat\""
    exit 1
fi

start_date=$1
end_date=$2

if [ -z "$3" ]
then
    snapshots=`gcloud compute snapshots list --format="value(name)" --filter="creationTimestamp>='${start_date}' AND creationTimestamp<='${end_date}'"`
else
    snapshots=`gcloud compute snapshots list --format="value(name)" --filter="creationTimestamp>='${start_date}' AND creationTimestamp<='${end_date}' AND ${3}"`
fi

if [ -z "$snapshots" ]
then
    echo "No snapshots found"
else
    gcloud compute snapshots delete $snapshots
fi


