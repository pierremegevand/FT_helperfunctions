function AvgRef=pm_computeAvgRef(data)

nChannels=numel(data.label);
nTrials=numel(data.trial);

AvgRef=[];
AvgRef.trial=cell(size(data.trial));
AvgRef.time=cell(size(data.trial));

for ctTrl=1:nTrials
    nTimeframes=numel(data.time{ctTrl});
    AvgRef.trial{ctTrl}=zeros(1,nTimeframes);
    AvgRef.time{ctTrl}=data.time{ctTrl};
    for ctTime=1:nTimeframes
        AvgRef.trial{ctTrl}(ctTime)=mean(data.trial{ctTrl}(:,ctTime));
    end
end

AvgRef.label={'avg'};
