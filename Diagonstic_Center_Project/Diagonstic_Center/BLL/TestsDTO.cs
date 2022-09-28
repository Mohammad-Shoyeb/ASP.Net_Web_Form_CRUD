using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Diagonstic_Center.BLL
{
    public class TestsDTO
    {
        public int Testid { get; set; }
        public string TestName { get; set; }
        public decimal Fee { get; set; }
        public int Typeid { get; set; }
    }
}