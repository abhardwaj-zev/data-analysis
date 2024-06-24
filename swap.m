function data = swap(data,index,indexflag1,indexflag2)
    [data{:,index(indexflag1)} data{:,index(indexflag2)}] = deal(data{:,index(indexflag2)},data{:,index(indexflag1)});
end