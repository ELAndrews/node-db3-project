const db = require("../data/dbConfig");

function find() {
  return db("schemes");
}

function findById(id) {
  if (db("schemes").whereNull(id) === null) {
    return null;
  } else {
    return db("schemes")
      .where({ id: id })
      .first();
  }
}

function findSteps(id) {
  return db("steps")
    .join("schemes", "steps.scheme_id", "schemes.id")
    .select(
      "steps.id",
      "schemes.scheme_name",
      "steps.step_number",
      "steps.instructions"
    )
    .where({ scheme_id: id })
    .orderBy("steps.step_number");
}

function add(scheme) {}

function update(changes, id) {}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update
};
