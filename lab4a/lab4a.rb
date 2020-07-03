#Your code goes here

import 'org.apache.hadoop.hbase.client.HTable'
import 'org.apache.hadoop.hbase.client.Put'

def jbytes( *args )
    args.map { |arg| arg.to_s.to_java_bytes }
end

def put_many( table_name, row, column_values)
    # Sets table name
    table = HTable.new( @hbase.configuration, table_name)
    # Sets row name
    p = Put.new( *jbytes(row))
    #Iterate through column_values
    column_values.each do |v|
        col_fam = v[0].split(":",-1)[0]
        col_qual = v[0].split(":",-1)[1]
        val = v[1]
        p.add( *jbytes( col_fam, col_qual, val) )
    end
table.put( p )
end

put_many  'wiki', 'NoSQL', {
"text:" => "What JavaScript framework do you prefer?",
"revision:author" => "Hector Carrillo",
"revision:comment" => "I prefer to use React" }

get 'wiki', 'NoSQL'

#Do not remove the exit call below
exit
