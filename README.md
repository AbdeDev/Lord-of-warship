# Lord-of-warship

step 1 : 
il vous faut d'abord avoir la bonne version de ruby donc la 3.3.4

- ruby -v
- si vous n'avez pas la bonne version, il faut installer rbenv
- rbenv list
- verifier les verions de ruby que vous avez et si vous n'avez pas la 3.3.4, il faut installer la bonne version
- rbenv install 3.3.4
- rbenv global 3.3.4 si vous voulez que cette version soit la version global par defaut
- rbenv local 3.3.4 si vous voulez que cette version soit la version local par defaut
- ruby -v

n'hesiter pas a mettre à jour vos gem si necessaire !!
-  gem install bundler
-  bundle install

step 2 : 
Vous etes maintenant prêt à lancer le projet et à teter le jeu

- git clone git@github.com:AbdeDev/Lord-of-warship.git
- cd Lord-of-warship
- ruby battle.rb

step 3 : 
Comment jouer au jeu 

- le jeu se joue en 2 joueurs
- le jeu se joue en ligne de commande
- chaque joeur à son tour place ses deux navires de manieres vertical ou horizontal
- une fois que chacun a placer ses deux navires le jeu commence, le joeur 1 commence toujours, si il tire et qu'il touche un navire adverse son tour continue si il rate son tour passe au joeur 2 qui joue de la meme maniere
- le jeu se termine quand un joueur a coule tous les navires de l'autre joueur
- une fois le jeu terminer, les joueurs ont le choix de recommencer ou non, si ils recommencent la grille est reset et la partie redemarre

step 4 : 

Comprehension du placement des navires

- les navires sont representés par des "X"
- les navires peuvent etre placés de maniere vertical ou horizontal
- les navires sont placés de maniere que les bords des navires soient a une distance d'au moins 1 case des bords de la map
- il n'est pas possible pour un joueur de placer deux navires sur les meme case (vous aurez un message d'erreur)
- la grille est une grille de 5x5
- les deux joueurs ont deux grilles différentes donc chacun place ses navires comme il le souhaite
- (cette partie est un peu complexe) Comment placer un navire, les coordonneés vont de 0 a 4, pour placer un navire il faut entrer deux coordonner par exemple 0 0 ou 0 1 ou 1 0 ou 1 1 ou 4 0 etc... si votre navire est bien placé il sera afficher sur la grille, les deux navires ont deux tailles differentes, une fais 3 case et l'autre 4, n'oubliez pas que le navire ne peut etre dehors de la grille ou entrer en collision avec un autre navire que vous avez deja placé

<img width="1440" alt="Capture d’écran 2024-07-29 à 18 21 44" src="https://github.com/user-attachments/assets/c317e819-e8a6-4943-b5e3-3848a68b34c5">

step 5 : 
Version bonus  

- dans la verion bonus il y'a des ajouts comme le fait de pouvoir mettre en diagonale ou encore que la partie se joue en BO3 
- pour jouer uniquement la verion de base il faut lancer le fichier battle.rb dans la branche dev
- pour jouer la verion bonus il faut lancer le fichier battle.rb dans la branche dev_bonus

  
