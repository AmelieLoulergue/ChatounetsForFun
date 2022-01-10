[![forthebadge](https://forthebadge.com/images/badges/built-with-love.svg)](https://forthebadge.com)[![forthebadge](https://forthebadge.com/images/badges/made-with-ruby.svg)](https://forthebadge.com)<br>
![Rails](https://img.shields.io/badge/rails-%23CC0000.svg?style=for-the-badge&logo=ruby-on-rails&logoColor=white)
# <center>CHATOUNETS &#128008;</center>
NB : Le design a été realisé pour ressembler à site web ancien, pour le fun ! Nous ne considérons pas ce projet comme une réussite au niveau design et comme une application utilisable en l'état ❤️
<br>
<center>❤️ Bienvenue sur CHATOUNETS ! ❤️</center><br/>
<center>❤️ LA référence en ligne de la vente de chatons en images ❤️</center>
<br><br>

***
## <center><span style="color:MediumSeaGreen">Testez-moi !</span></center>
***
Ce [site](https://chatounets.herokuapp.com/) vous permet d'acheter des chatons en ligne, que vous recevrez par mail dès que votre paiement sera validé. 

Pour le paiement par Stripe, renseignez les informations suivantes :
* Adresse e-mail: test@test.com 
* Numéro de carte: 4242 4242 4242 4242 
* MM/AA: date valide
* CVV: faites-vous plaisir !

<span style="color:red">**WARNING:**</span> pour les personnes sensibles aux <span style="color:red">miaulements de chats</span>, diminuez ou coupez le son de votre ordinateur. Personnes sensibles, s'abstenir. 
<br><br><br>
***
## <center><span style="color:MediumSeaGreen">Auteurs</span></center>
***

- [Marin Chrétien](https://github.com/marinmari) 🏄‍♂️ - dit LE CERVEAU -  🧠
- [David Guetta (le vrai)](https://github.com/davguetta) 🎙️ - dit LE MASTER DB - 
- [Jonathan Justman (il n'est pas américain)](https://github.com/Justmanovic) - dit LE MASTER CSS - 
- [Ambroise Bréant](https://github.com/ambizance) 👁️ - dit LE BORGNE - 🏴‍☠️
- [Amélie Loulergue](https://github.com/AmelieLoulergue) 💁‍♀️ - dite LA PLUS SERIEUSE DE L'EQUIPE - 🐱

<br>

# <center>Comment ça marche &#128008; ?</center>
Les instructions suivantes vous permettront d'obtenir une copie en local sur votre ordinateur du projet pour tester & développer à partir du code source de notre super site en ligne ! <br/>
**<center> ❤️FEEL FREE TO EXPLORE!❤️ </center>**<br>


***
## <center><span style="color:MediumSeaGreen">Prérequis</span></center>
***

Pour un fonctionnement en local réussi:
- Ruby version : **2.7.4** 
- Rails version : **5.2.6**
- Database : **PostgreSQL**
- Un compte Stripe avec des clés d'API pour le paiement
- Un compte Sendgrid avec des clés d'API pour le mailer
- Un compte Amazon S3 pour le stockage des images 
- Un compte ForestAdmin pour le backend Admin 

***
## <center><span style="color:MediumSeaGreen">Comment l'utiliser?</span></center>
***

Commandes CLI : 
- git clone https://github.com/AmelieLoulergue/boutique_chatons_woovv.git
- bundle install
- rails db:create db:migrate db:seed
- rails server 


