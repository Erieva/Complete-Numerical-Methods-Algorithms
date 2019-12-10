function x = myrealmin()
clc;
srn=1
temp =srn
while (eps*temp/2)>0
    temp=(eps*temp/2)
    if temp > 0
        srn = temp;
    end
end

