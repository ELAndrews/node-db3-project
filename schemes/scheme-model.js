const db = require("../data/dbConfig");

function find() {
  return db("schemes");
}

function findById(id) {
  return db("schemes")
    .where({ id: id })
    .first();
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

async function add(scheme) {
  try {
    const [id] = await db("schemes").insert(scheme);
    return findById(id);
  } catch (error) {
    console.log(error);
  }
}

async function update(changes, id) {
  try {
    await db("schemes")
      .where({ id: id })
      .update(changes);
    return findById(id);
  } catch (error) {
    console.log(error);
  }
}

function remove(id) {
  return db("schemes")
    .where({ id: id })
    .delete();
}

module.exports = {
  find,
  findById,
  findSteps,
  add,
  update,
  remove
};
