//seed for clients
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('clients').del()
    .then(function () {
      // Inserts seed entries
      return knex('clients').insert([
        {clients_name: 'Marcellus Wallace'},
        {clients_name: 'Concerto'},
        {clients_name: 'Mathilda'},
        {clients_name: 'Winston'},
        {clients_name: 'Ray Vargo'}
      ]);
    });
};
