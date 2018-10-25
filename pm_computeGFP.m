function GFP=pm_computeGFP(data)

nChannels=numel(data.label);
nTrials=numel(data.trial);

AvgRef=pm_computeAvgRef(data);

GFP=[];
GFP.trial=cell(size(data.trial));
GFP.time=cell(size(data.trial));

for ctTrl=1:nTrials
    nTimeframes=numel(data.time{ctTrl});
    GFP.trial{ctTrl}=zeros(1,nTimeframes);
    GFP.time{ctTrl}=data.time{ctTrl};
    for ctTime=1:nTimeframes
        GFP.trial{ctTrl}(ctTime)=sqrt(sum((data.trial{ctTrl}(:,ctTime)-AvgRef.trial{ctTrl}(ctTime)).^2)./nChannels);
    end
end
