#!/bin/bash

# fait n1 requêtes / secondes pendant n2 secondes. Si n2=0, fait n1 requêtes en instantané

# Function to perform a DNS query using dig
query_dns() {
    local domain=$1
    local record_type=$2
    kdig +tls +short @157.159.55.165 $domain $record_type >/dev/null 2>&1
    
    # Perform the DNS query
    $record_type >/dev/null 2>&1
}

# Function to run multiple queries
run_queries() {
    local record_type=$1
    local total_requests_per_second=$2
    local total_requests=total_requests_per_second*time
    local time=$3
    
    # Calculate the interval between requests in seconds

    local websites="compendium.txt"
    local start=$RANDOM

    if [ $3 == 0 ];then
        for ((i = 1; i < total_requests_per_second+1; i++)); do
            #a=$(((i+start) % 327960))
            #local ligne=$(awk "NR == $a" "$websites")
            local ligne=$(awk "NR == $i" "$websites")
            query_dns $ligne $record_type &
            # pas de sleep
        done
    else
        local interval=$(bc -l <<< "1/$total_requests_per_second")
        for ((i = 1; i < total_requests+1; i++)); do
            # Run the DNS query in the background
            a=$(((i+start) % 327960))
            local ligne=$(awk "NR == $a" "$websites")
            query_dns $ligne $record_type &

            # Control the rate by sleeping
            sleep $interval
        done
    fi
    
    
    # Wait for all background jobs to finish
    wait
}

# Main script execution
if [[ $# -lt 4 ]]; then
    echo "Usage: $0 <record_type> <total_requests> <requests_per_second> <number_of_clients>"
    echo "Example: $0 A 100 10"
    echo "pls use a multiple of number_of_clients for requests_per_second and total_requests"
    exit 1
fi

number_of_clients=$4
RECORD_TYPE=$1
TOTAL_REQUESTS=$2
REQUESTS_PER_SECOND=$3
total_Requests_per_client_per_second=$(echo "$REQUESTS_PER_SECOND / $number_of_clients" | bc)
time=$(echo "$TOTAL_REQUESTS / $REQUESTS_PER_SECOND" | bc)

# Export the function to be used in subshells
export -f query_dns
export -f run_queries

# Run the queries
seq $number_of_clients | parallel -j $number_of_clients run_queries $RECORD_TYPE $total_Requests_per_client_per_second $time
