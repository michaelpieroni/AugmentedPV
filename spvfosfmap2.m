function [ map_int,map_std] = spvfosfmap( type_map,fr,fc )

%%INPUT:
%   type_map tipo di mappa utilizzata: uniforme o non uniforme
%   fr e fc sono il numero di fosfeni er riga e per colonna

%%OUTPUT:
%   map_int: phosphene map intensity
%   map_std: phosphene map standard deviation

switch (type_map)
    case('Uniform')
        % by default intensity and std are equal to one
        map_int = ones(fr,fc);
        map_std = ones(fr,fc);                   
        
    case ('Not Uniform')
        error ('Not uniform is not already implemented')
end

end

