def merge_intervals(intervals):
    merged = []
    current_identifier = None
    start = end = None

    for interval in intervals:
        identifier, interval_start, interval_end = interval

        if current_identifier is None:
            current_identifier = identifier
            start = interval_start
            end = interval_end
        elif identifier == current_identifier and interval_start <= end:
            # If the identifier matches and there is an overlap, extend the current interval.
            end = max(end, interval_end)
        else:
            # If the identifier changes or there is no overlap, append the current interval and start a new one.
            merged.append((current_identifier, start, end))
            current_identifier = identifier
            start = interval_start
            end = interval_end

    # Append the last interval.
    if current_identifier is not None:
        merged.append((current_identifier, start, end))

    return merged

def main():
    intervals = []

    # 从文件中读取区间数据
    with open('numtcp.txt', 'r') as file:
        for line in file:
            parts = line.strip().split('\t')
            if len(parts) == 3:
                identifier = parts[0]
                start = int(parts[1])
                end = int(parts[2])
                intervals.append((identifier, start, end))

    # 合并区间
    merged_intervals = merge_intervals(intervals)

    # 将合并后的区间保存到新文件
    with open('numtcp_new.txt', 'w') as new_file:
        for interval in merged_intervals:
            new_file.write(f"{interval[0]}\t{interval[1]}\t{interval[2]}\n")

if __name__ == "__main__":
    main()

