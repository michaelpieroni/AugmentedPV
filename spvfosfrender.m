function [ m ] = spvfosfrender( map,type_map,intensity,amplitude,varargin )
%prende in ingresso la mappa di fosfeni, il tipo di mappa ovvero una
%stringa , i dati relativi a ogni fosfene ovvero intensita e ampiezza nel
%caso di mappa uniforme varargin conterr� r e c ovvero le righe e le
%colonne per ogni fosfene
[x,y]=find(map);          
m=zeros(size(map));
switch(type_map)
    case{'uniform'}
            r=varargin{1}
            c=varargin{2}
            lx = (-r):(r); 
            ly = (-c):(c); 
            [lX,lY] = meshgrid(lx,ly);
            for i=1:length(x)
                px=x(i);
                py=y(i);
                arg=((lX.^2+lY.^2)./(amplitude(i).^2)); frqfilt=intensity(i).*exp(-arg);  
                frqfilt=frqfilt';
                m(px-r:px+r,py-c:py+c)=frqfilt;
            end
    case {'notuniform'}
        [r,c]=size(map);
        [x,y]=find(map);
        m(1:2*r,1:2*c,length(x))=zeros(2*r,2*c);
        lx=[-r/2:r/2-1];
        ly=[-c/2:c/2-1];
        [lX,lY]=meshgrid(lx,ly);
        for i=1:length(x)
            px=x(i)+r/2;
            py=y(i)+r/2;
            arg=((lX.^2+lY.^2)./(amplitude(i).^2)); frqfilt=intensity(i).*exp(-arg);  
            frqfilt=frqfilt';
            m(px-r/2:px+r/2-1,py-c/2:py+c/2-1,i)=frqfilt;
           
        end
       m=cumsum(m,3);
       m=m(:,:,length(x));
       m=m(r/2:r+r/2-1,c/2:c+c/2-1);
end
                
            

end

