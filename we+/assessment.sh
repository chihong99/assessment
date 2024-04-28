#!/bin/bash

# Usage: ./ec2_snapshot.sh INSTANCE_ID

INSTANCE_ID=$1

# Get list of volume IDs attached to the instance
VOLUME_IDS=$(aws ec2 describe-instances --instance-id $INSTANCE_ID \
    --query 'Reservations[].Instances[].BlockDeviceMappings[].Ebs.VolumeId' --output text)

for VOLUME_ID in $VOLUME_IDS; do

    # Create a snapshot
    SNAPSHOT_ID=$(aws ec2 create-snapshot --volume-id $VOLUME_ID \
        --description "Snapshot for instance $INSTANCE_ID" --query SnapshotId --output text)

    # Tag the snapshot
    aws ec2 create-tags --resources $SNAPSHOT_ID \
        --tags Key=Backup,Value=Daily Key=Date,Value=$(date +%Y-%m-%d)
done

# Get list of old snapshots
OLD_SNAPSHOTS=$(aws ec2 describe-snapshots \
    --filters Name=tag:Backup,Values=Daily Name=tag:Date,Values=* \
    --query 'Snapshots[?StartTime<=`'$(date --date='-7 days' +%Y-%m-%d)'`].[SnapshotId]' --output text)

# Cleanup old snapshots
for snapshot in $OLD_SNAPSHOTS; do
    aws ec2 delete-snapshot --snapshot-id $snapshot
done
