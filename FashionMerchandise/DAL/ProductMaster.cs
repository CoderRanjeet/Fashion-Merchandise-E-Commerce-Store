using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace FashionMerchandise.DAL
{
    public class ProductMaster
    {
        public long Id { get; set; }
        public string ProductName { get; set; }
        public Decimal? Price { get; set; }
        public string Image { get; set; }
        public string Description { get; set; }

        public void Add()
        {
            try
            {
                string Constr = ConfigurationManager.ConnectionStrings["FashionMerchandise"].ConnectionString;
                using (SqlConnection Con = new SqlConnection(Constr))
                {
                    string Sql = @"insert into [Products]
                                      (
                                        [ProductName]
                                       ,[Price]
                                       ,[Image]
                                      ,[Description]
                                       )
                                       values
                                        (
                                        @ProductName
                                       ,@Price
                                       ,@Image
                                       ,@Description
                                       );";
                    Sql += "select scope_identity();";
                    Con.Open();

                    using (SqlCommand cmd = new SqlCommand(Sql, Con))
                    {
                        cmd.Parameters.Add("@ProductName", SqlDbType.NVarChar, 100).Value = ProductName == null ? (Object)DBNull.Value : ProductName;
                        cmd.Parameters.Add("@Price", SqlDbType.Decimal,8).Value = Price == null ? (Object)DBNull.Value : Price;
                        cmd.Parameters.Add("@Image", SqlDbType.NVarChar, 50).Value = Image == null ? (Object)DBNull.Value : Image;
                        cmd.Parameters.Add("@Description", SqlDbType.NVarChar,250).Value = Description == null ? (Object)DBNull.Value : Description;

                        Id = Convert.ToInt64(cmd.ExecuteScalar());
                        Con.Close();
                    }
                }
            }
            catch (Exception Ex)
            {
                var Msg = Ex.Message;
            }
        }

        public static DataTable GetProducts()
        {
            DataTable Dt = new DataTable();
            try
            {
                string Constr = ConfigurationManager.ConnectionStrings["FashionMerchandise"].ConnectionString;
                using (SqlConnection Con = new SqlConnection(Constr))
                {
                    string Sql = @"select * from [Products];";

                    Con.Open();

                    using (SqlCommand cmd = new SqlCommand(Sql, Con))
                    {

                        using (SqlDataReader Rd = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        {
                            Dt.Load(Rd);
                        }
                    }
                    Con.Close();
                }
            }
            catch (Exception Ex)
            {
                var Msg = Ex.Message;
            }
            return Dt;
        }

        public static ProductMaster Get(long Id)
        {
            ProductMaster TblProduct= new ProductMaster();
            try
            {
                string Constr = ConfigurationManager.ConnectionStrings["FashionMerchandise"].ConnectionString;
                using (SqlConnection Con = new SqlConnection(Constr))
                {
                    string Sql = @"select * from [Products] where [Id]=@Id";
                    Con.Open();

                    using (SqlCommand cmd = new SqlCommand(Sql, Con))
                    {
                        cmd.Parameters.Add("@Id", SqlDbType.BigInt, 8).Value = Id;
                        using (SqlDataReader Rd = cmd.ExecuteReader(CommandBehavior.CloseConnection))
                        {
                            if (Rd.Read())
                            {
                                TblProduct.ProductName = Rd["ProductName"] == DBNull.Value ? null : Rd["ProductName"].ToString();
                                TblProduct.Price = Convert.ToDecimal(Rd["Price"]);
                                TblProduct.Description = Rd["Description"] == DBNull.Value ? null : Rd["Description"].ToString();
                                TblProduct.Image = Rd["Image"] == DBNull.Value ? null : Rd["Image"].ToString();
                            }
                        }
                    }
                    Con.Close();
                }
            }
            catch (Exception Ex)
            {
                var Msg = Ex.Message;
            }
            return TblProduct;
        }
        public void Update()
        {
            try
            {
                string Constr = ConfigurationManager.ConnectionStrings["FashionMerchandise"].ConnectionString;
                using (SqlConnection Con = new SqlConnection(Constr))
                {
                    string Sql = @"update [Products]
                                        set   [ProductName] =@ProductName
                                              ,[Price] = @Price
                                               ,[Description] = @Description
                                               where [Id] =@Id;";
                                       
                    Con.Open();

                    using (SqlCommand cmd = new SqlCommand(Sql, Con))
                    {
                        cmd.Parameters.Add("@Id", SqlDbType.BigInt, 8).Value = Id;
                        cmd.Parameters.Add("@ProductName", SqlDbType.NVarChar, 100).Value = ProductName == null ? (Object)DBNull.Value : ProductName;
                        cmd.Parameters.Add("@Price", SqlDbType.Decimal,8).Value = Price == null ? (Object)DBNull.Value : Price;
                        cmd.Parameters.Add("@Description", SqlDbType.NVarChar, 250).Value = Description == null ? (Object)DBNull.Value : Description;
                      //  cmd.Parameters.Add("@Image", SqlDbType.NVarChar, 50).Value = Image == null ? (Object)DBNull.Value : Image;
                       
                      int Status =  cmd.ExecuteNonQuery();
                        if(Status == 1)
                        {
                            Id = 1;
                        }
                        else
                        {
                            Id = 0;
                        }
                        Con.Close();
                    }
                }
            }
            catch (Exception Ex)
            {
                var Msg = Ex.Message;
            }
        }

        public bool Delete(long Id)
        {
            bool IsDelete = false;
            try
            {
                string Constr = ConfigurationManager.ConnectionStrings["FashionMerchandise"].ConnectionString;
                using (SqlConnection Con = new SqlConnection(Constr))
                {
                    string Sql = @"delete [Products] where [Id]=@Id";

                    Con.Open();

                    using (SqlCommand cmd = new SqlCommand(Sql, Con))
                    {
                        cmd.Parameters.Add("@Id", SqlDbType.BigInt, 8).Value = Id;

                        int Msg = cmd.ExecuteNonQuery();
                        if (Msg == 1)
                        {
                            IsDelete = true;
                        }
                        else
                        {
                            IsDelete = false;
                        }
                    }
                    Con.Close();
                }
            }
            catch (Exception Ex)
            {
                var Msg = Ex.Message;
            }
            return IsDelete;
        }
    }
}