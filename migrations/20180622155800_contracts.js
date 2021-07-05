//table for contracts
exports.up = function(knex, Promise) {
  return knex.schema.createTable('contracts', function(table) {
    table.increments();
    table.integer('target_id').references('targets.id');
    table.integer('client_id').references('clients.id');
    table.integer('budget');
    table.boolean('completed');
    table.integer('assassins_id').references('assassins.id');
  })
};

exports.down = function(knex, Promise) {
  return knex.schema.dropTable('contracts');
};
