using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Diagonstic_Center.BLL
{
    public class TestsManager
    {
        SqlConnection con;
        public TestsManager()
        {
            this.con = new SqlConnection(ConfigurationManager.ConnectionStrings["Db"].ConnectionString);
        }
        public ICollection<TestsDTO> GetAll()
        {
            List<TestsDTO> tests = new List<TestsDTO>();
            DataTable dt = new DataTable();
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM tests", this.con))
            {
                da.Fill(dt);
                foreach (var r in dt.AsEnumerable())
                {
                    tests.Add(new TestsDTO
                    {
                        Testid = r.Field<int>("testid"),
                        TestName = r.Field<string>("testname"),
                        Fee = r.Field<decimal>("fee"),
                        Typeid = r.Field<int>("typeid")

                    });
                }
                return tests;
            }
        }
        public void Insert(TestsDTO dto)
        {
            string sql = @"INSERT INTO [dbo].[tests]
                           ([testname]
                           ,[fee]
                           ,[typeid])
                     VALUES
                           (@testname
                           ,@fee
                           ,@typeid)";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@testname", dto.TestName);
                cmd.Parameters.AddWithValue("@fee", dto.Fee);
                cmd.Parameters.AddWithValue("@typeid", dto.Typeid);
                cmd.Parameters.AddWithValue("@testid", dto.Testid);

                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                finally
                {
                    if (con.State == ConnectionState.Open)
                    {
                        this.con.Close();
                    }
                }
            }
        }
        public void Update(TestsDTO dto) {
            string sql = @"Update[dbo].[tests]
                        SET [testname]=@testname
                           ,[fee]=@fee
                           ,[typeid]=@typeid
                    WHERE testid=@testid";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@testname", dto.TestName);
                cmd.Parameters.AddWithValue("@fee", dto.Fee);
                cmd.Parameters.AddWithValue("@typeid", dto.Typeid);
                cmd.Parameters.AddWithValue("@testid", dto.Testid);
                this.con.Open();
                try
                {
                    int x = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }

        public void Delete(TestsDTO dto) {
            string sql = "DELETE FROM tests WHERE testid = @testid";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@testid", dto.Testid);

                this.con.Open();
                try
                {
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                this.con.Close();
            }
        }
        public DataTable TesttypesDropItems()
        {
            using (SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Testtypes", this.con))
            {
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
        }
        public string Gettypename(int id)
        {
            string sql = "SELECT typename FROM testtypes WHERE typeid=@id";
            using (SqlCommand cmd = new SqlCommand(sql, this.con))
            {
                cmd.Parameters.AddWithValue("@id", id);
                try
                {
                    con.Open();
                    string name = cmd.ExecuteScalar().ToString();
                    con.Close();
                    return name;
                }
                catch (Exception ex)
                {
                    throw ex.InnerException;
                }
                finally
                {
                    if (con.State == ConnectionState.Open) con.Close();
                }
            }
        }
    }
}