using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace QL_PHONGGYM.Models
{

    public class ScheduleViewModel
    {
        public int Id { get; set; }           
        public string Type { get; set; }        
        public string Title { get; set; }       
        public string SubTitle { get; set; }   
        public DateTime Date { get; set; }     
        public TimeSpan Start { get; set; }   
        public TimeSpan End { get; set; }      
        public string Status { get; set; }   
        public string ColorClass { get; set; }  
    }
}