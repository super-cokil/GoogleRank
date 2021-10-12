function [mat,v] = DataImporter(lien)

fname = lien; 
fid = fopen(fname); 
raw = fread(fid,inf); 
str = char(raw'); 
fclose(fid); 
val = jsondecode(str);
val(1).character_name

taille = size(val,1)
m=zeros(taille,taille);

mapLinkToInd = containers.Map;

characters = blanks(taille);

size(characters)
%on cree une map permettant de recuperer l'indice de la valeur a partir de
%l'url
for i=1:taille
    mapLinkToInd(val(i).character_url) = i;
end

% class(val(1).character_url)
% class(val(1).links(1))

for i=1:taille
    mesLinks = val(i).links;
    for l=1:size(mesLinks)
        proba = 1.0/size(mesLinks,1);
        colonneInd = mapLinkToInd(char(mesLinks(l)))
        m(colonneInd,i) = proba;
    end
end
        
mat =m;
v = val;
end

