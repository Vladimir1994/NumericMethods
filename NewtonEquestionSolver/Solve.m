function [nulls, cnt] = Solve(start_interval, null_cnt)
    intervals = fragmentation(start_interval, null_cnt);
    for i = 1:length(intervals)
        [nulls(i) cnt(i)] = UnimodalSearch(intervals(i, :));
    end
end