Configurar Ambiente Linux/Ubuntu

Antes de instalar o Ruby é recomendado atualizar a O.S e instalar algumas dependências que podem não estar instaladas na máquina:
    sudo apt-get update
    sudo apt-get install build-essential
    sudo apt-get install autoconf bison libssl-dev libyaml-dev libreadline6-dev zlib1g-dev libncurses5-dev libffi-dev libgdbm5 libgdbm-dev

Instalando o gerenciador de versionadores (ASDF):
O asdf é um gerenciador universal de linguagens, aqui vamos explicar sobre o Ruby, mas a ferramenta pode ser usada em linguagens como Node, PHP, Java, Go, etc.

   Documentação:
    https://asdf-vm.com/#/core-manage-asdf-vm
    https://github.com/asdf-vm/asdf - Connect to preview 

Para instalar, abra o terminal e cole o comando abaixo:

    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8

Para configurar o Path, abra o terminal e digite:

    sudo vim ~/.bashrc

Ir até o final da página;Clicar em "i" (de insert);Colar as seguintes linhas:

    $HOME/.asdf/asdf.sh
    $HOME/.asdf/completions/asdf.bash

Pressionar "Esc";Pressionar “Shift  +  : ”; Digitar wq! - Significa (w)write and (q)quit; Fechar terminal e abrir novamente; Digitar:

    asdf --version

Exemlo de Output esperado: v0.7.8-4a3e3d6
Caso esteja tudo OK, digite:

    asdf updtade

Esse comando serve para atualizar para a última versão, caso tenha alguma disponível.

Instalar o plugin de Ruby:

    asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git

Para listar a última versão:

    asdf latest ruby

Para instalar a versão de Ruby, digite - asdf install ruby "versão" - como no exemplo abaixo:

    asdf install ruby 2.6.4

Depois de instalar a versão, aplicar como Global; asdf global ruby "versão"como no exemplo abaixo: 

    asdf global ruby 2.6.4

OBS: Ao trocar de versão de Ruby (ou outra linguagem), executar o comando reshim:

    asdf reshim ruby

Após instalar e configurar o Global da linguagem, digite:

    ruby -v  

Caso a versão que foi instalada seja exibida no terminal, a configuração está correta.


Instalar bibliotecas (gems)
Para os projetos legados, é necessário baixar localmente as bibliotecas usadas na automação. Para isso:

Instalar a gem "bundler" - Essa ferramenta baixa as versões especificadas no gemfile.lock, garantido que os ambiente do projeto fique equiparado em qualquer local. Dessa forma evita-se problemas de versões incompatíveis e outros tipos de conflito.

    gem install bundler 'versão'

A versão do bundler utilizada é especificada no final do arquivo gemfile.lock "Bundled With"
Ou caso esteja muito desatualizado o Bundler, apagar o gemfile.lock e rodar o “bundle install”, como no exemplo abaixo:

    gem install bundler
    bundle install

Instalar Chromedriver
Antes de instalar verificar o local que o chromedriver está especficado no projeto

Baixar o Chromedriver compatível com a versão do Chrome utilizado (verificar no "help" > "about chrome") - https://chromedriver.chromium.org/chromedriver-canary

Descompacte o arquivo e mova o "chromedriver" no path utilizado no projeto

Para os testes locais, pode-se instalar o Chromedriver no binário (Linux) - path: /usr/local/bin/ - dessa forma não é necessário passar o path do chromedriver no projeto.

Rodando o projeto:
Comando para rodar o projeto é o :

    cucumber -p chrome

Com esse comando ele vai rodar já com o Report ativado, no google Chrome e todos os Steps que ele encontrar
Automatizado.
    