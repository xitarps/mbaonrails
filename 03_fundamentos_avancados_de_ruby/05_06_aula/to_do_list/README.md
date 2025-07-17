# Exercicio Aula 05 e 06

## Criando uma API de Tarefas com Rails

### Teconlogias:
 
 - Ruby
 - Rails
 - PostgreSQL
 - SolidQueue
 - Ransack

### Funcionalidades

- API permite criar, atualizar, deletar,
visualizar e listar tarefas

- Uma Tarefa é composta por: título, descrição, status

- Os status de uma tarefa são: Em andamento, Em atraso, Concluída e Cancelada

- O endpoint de DELETE não remove o registro da tarefa, apenas a marca como “Cancelada”

- Uma tarefa pode ter um campo “Data de entrega”, que é opcional.
  Quando uma tarefa não é concluída até essa data, seu status é atualizado automaticamente para “Em atraso”(diariamente)

- É possível filtrar tarefas por status, título, descrição, data de criação e data de entrega
  Atravez do Ransack
  ex:

  ```
  http://127.0.0.1:3000/api/v1/assignments.json?q[title_cont]=mod
  ```
