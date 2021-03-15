# Documentação

## Para rodar esse projeto localmente em sua máquina

* Clone o repositório para a sua máquina: `git clone git@github.com:Vinicius-CP/twitter-api.git`
* Entre na pasta: `cd twitter-api`
* Atualize o projeto: `bundle install`
* Inicie o servidor: `rails s`

## Para criar um tweet através da API

* Use a seguinte rota para a requisição: `http://localhost:3000/api/v1/week_weather`
* Use o seguinte formato para a requisição:
`{
	"city": cidade,
	"api_key": api_key
}`
OBS: No campo `cidade` você pode escolher qualquer valor e no campo `api_key` deve ser inserida sua key do OpenWeatherMap

* Espere como resposta o seguinte texto com status 200: 
`{
  "message": "Tweet sended!"
}`

* O seu tweet deverá ter um formato semelhante a: `24ºC e céu limpo em <cidade> em 15/03. Média para os próximos dias: 23ºC em 16/03, 24ºC em 17/03, 25ºC em 18/03, 24ºC em 19/03, 24ºC em 20/03.`
