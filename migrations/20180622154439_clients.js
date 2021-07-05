
//table for clients
exports.up = function(knex, Promise) {
  return knex.schema.createTable('clients', function(table) {
    table.increments();
    table.string('clients_name');
  })
};



exports.down = function(knex, Promise) {
  return knex.schema.dropTable('clients');
};
