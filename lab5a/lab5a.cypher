CREATE (Jonas:Person {name: 'Jonas Kahnwald', born: 2002})
CREATE (Martha: Person {name: 'Martha Nielsen', born: 2000})
CREATE (Michael: Person {name: 'Michael Kahnwald', born: 2008})
CREATE (Hannah: Person {name: 'Hannah Kahnwald', born: 1972})
CREATE (Ulrich: Person {name: 'Ulrich Nielsen', born: 1970})
CREATE (Katharina: Person {name: 'Katharina Nielsen', born: 1970})
CREATE (Magnus: Person {name: 'Magnus Nielsen', born: 2000})
CREATE (Franziska: Person {name: 'Franziska Doppler', born: 2001})

CREATE
  (Hannah)-[:SPOUSE {married:2000}]->(Michael),
  (Michael)-[:SPOUSE {married:2000}]->(Hannah),
  (Hannah)-[:CHILD {type:'son'}]->(Jonas),
  (Michael)-[:CHILD {type:'son'}]->(Jonas),
  (Jonas)-[:PARENT {type:'father'}]->(Michael),
  (Jonas)-[:PARENT {type:'mother'}]->(Hannah),
  (Jonas)-[:ROMANCE {type:'girlfriend'}]->(Martha),
  (Martha)-[:ROMANCE {type:'boyfriend'}]->(Jonas),
  (Martha)-[:PARENT {type:'father'}]->(Ulrich),
  (Martha)-[:PARENT {type:'mother'}]->(Katharina),
  (Ulrich)-[:CHILD {type:'daughter'}]->(Martha),
  (Katharina)-[:CHILD {type:'daughter'}]->(Martha),
  (Ulrich)-[:CHILD {type:'son'}]->(Magnus),
  (Katharina)-[:CHILD {type:'son'}]->(Magnus),
  (Magnus)-[:PARENT {type:'father'}]->(Ulrich),
  (Magnus)-[:PARENT {type:'mother'}]->(Katharina),
  (Magnus)-[:ROMANCE {type:'girlfriend'}]->(Franziska),
  (Franziska)-[:ROMANCE {type:'boyfriend'}]->(Magnus),
  (Ulrich)-[:CHILD {type:'son'}]->(Michael),
  (Katharina)-[:CHILD {type:'son'}]->(Michael),
  (Michael)-[:PARENT {type:'father'}]->(Ulrich),
  (Michael)-[:PARENT {type:'mother'}]->(Katharina)
;
