using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
namespace Experiment
{
    public class Database
    {
        private SqlConnection conn;
        private SqlCommand cmd;
        private SqlDataAdapter da;
        private DataTable dt;

        public void DB_Connect()
        {
            conn = new SqlConnection(@"Data Source=SHAKIL\SQLEXPRESS;Initial Catalog=Emperiment;Integrated Security=True");
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
        }

        public int Execute_Query(string query)
        {
            try
            {
                DB_Connect();
                cmd = new SqlCommand(query, conn);

                cmd.ExecuteNonQuery();
                return 1;

            }
            catch (Exception )
            {
                return 0;
                throw;
            }
     
                
          
        }

        public DataTable GetData(string query)
        {
            try
            {
                DB_Connect();
                cmd = new SqlCommand(query, conn);
                dt = new DataTable();
                da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                return dt;
            }
            catch (SqlException ex)
            {

                throw ex;
            }
        }
    }
}