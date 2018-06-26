
exports.seed = function(knex, Promise) {
  // Deletes ALL existing entries
  return knex('contracts').del()
    .then(function () {
      // Inserts seed entries
      return knex('contracts').insert([
        {target_id: default, client_id: 1, budget: 40, completed: false, assassins_id: null},
        {target_id: default, client_id: 2, budget: 70, completed: false, assassins_id null},
        {target_id: default, client_id: 3, budget: 35, completed: false, assassins_id: null},
        {target_id: default, client_id: 4, budget: 25, completed: false, assassins_id null},
        {target_id: default, client_id: 5, budget: 10, completed: false, assassins_id: null}

      ]);
    });
};


///have not yet uploaded this seed!
