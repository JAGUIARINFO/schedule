# Criando nossos Users --- OBS: Depois que adicionarmos o devise precisamos incluir o email e senha dos users
User.create name: 'Disponível', email: 't@t.com', password: 123456
User.create name: 'Julio', email: 't1@teste.com', password: 123456
User.create name: 'Alberto', email: 't2@teste.com', password: 123456


<td><%= link_to 'Show', booking %></td>
<td><%= link_to 'Edit', edit_booking_path(booking) %></td>
<td><%= link_to 'Destroy', booking, method: :delete, data: { confirm: 'Are you sure?' } %></td>
