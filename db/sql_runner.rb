require('pg')

class SqlRunner
  def self.run(sql, values = [])
    begin
      db = PG.connect({dbname: 'dev6t7tr61giuk', host: 'ec2-107-21-99-237.compute-1.amazonaws.com', port:5432, user:'ngdgqroqjyenkq', password:'15a5ade8441621b5ff7a47719e5082097d9479eb67dd2a40c8ee570d82bc05dd'})
      db.prepare("query", sql)
      results = db.exec_prepared("query", values)
    ensure
      db.close() if db != nil
    end
    return results
  end
end
