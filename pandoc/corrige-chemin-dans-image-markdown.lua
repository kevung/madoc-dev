-- permet de corriger le chemin d'une image markdown
-- en effet, avec pandoc, les liens sont relatifs au dossier
-- où est lancee la commande pandoc, et non par rapport au fichier
-- markdown

function Image (img)
  img.src = img.src:gsub('../images/(.+)', './images/%1')
  return img
end
