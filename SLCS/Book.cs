//------------------------------------------------------------------------------
// <auto-generated>
//     這個程式碼是由範本產生。
//
//     對這個檔案進行手動變更可能導致您的應用程式產生未預期的行為。
//     如果重新產生程式碼，將會覆寫對這個檔案的手動變更。
// </auto-generated>
//------------------------------------------------------------------------------

namespace SLCS
{
    using System;
    using System.Collections.Generic;
    
    public partial class Book
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Book()
        {
            this.Reserve = new HashSet<Reserve>();
            this.BorrowLog = new HashSet<BorrowLog>();
        }
    
        public int Id { get; set; }
        public string Bookname { get; set; }
        public string Author { get; set; }
        public string Publisher { get; set; }
        public string PublishPlace { get; set; }
        public string PublishYear { get; set; }
        public string Isbn { get; set; }
        public int TopicId { get; set; }
        public int BookStatusId { get; set; }
        public int LocationId { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Reserve> Reserve { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BorrowLog> BorrowLog { get; set; }
        public virtual Topic Topic { get; set; }
        public virtual BookStatus BookStatus { get; set; }
        public virtual Location Location { get; set; }
    }
}
