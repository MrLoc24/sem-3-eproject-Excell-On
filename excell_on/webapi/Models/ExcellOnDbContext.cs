using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace webapi.Models
{
    public partial class ExcellOnDbContext : DbContext
    {
        public ExcellOnDbContext()
        {
        }

        public ExcellOnDbContext(DbContextOptions<ExcellOnDbContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Banking> Bankings { get; set; } = null!;
        public virtual DbSet<CardPayment> CardPayments { get; set; } = null!;
        public virtual DbSet<Customer> Customers { get; set; } = null!;
        public virtual DbSet<Department> Departments { get; set; } = null!;
        public virtual DbSet<MyCompany> MyCompanies { get; set; } = null!;
        public virtual DbSet<Order> Orders { get; set; } = null!;
        public virtual DbSet<OrderDetail> OrderDetails { get; set; } = null!;
        public virtual DbSet<Role> Roles { get; set; } = null!;
        public virtual DbSet<Service> Services { get; set; } = null!;
        public virtual DbSet<StaffOrderDetail> StaffOrderDetails { get; set; } = null!;
        public virtual DbSet<UserInFo> UserInFos { get; set; } = null!;
        public virtual DbSet<staff> staff { get; set; } = null!;



        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Banking>(entity =>
            {
                entity.ToTable("Banking");

                entity.Property(e => e.DateCreate).HasColumnType("date");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Bankings)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK__Banking__Custome__412EB0B6");

                entity.HasOne(d => d.Order)
                    .WithMany(p => p.Bankings)
                    .HasForeignKey(d => d.OrderId)
                    .HasConstraintName("FK__Banking__OrderId__4222D4EF");
            });

            modelBuilder.Entity<CardPayment>(entity =>
            {
                entity.ToTable("CardPayment");

                entity.Property(e => e.Id)
                    .ValueGeneratedNever()
                    .HasColumnName("id");

                entity.Property(e => e.Cvv).HasColumnName("CVV");

                entity.Property(e => e.DateExpired).HasColumnType("date");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CardPayments)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK_CardPayment_Customer");
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.ToTable("Customer");

                entity.Property(e => e.CustomerAvatar)
                    .HasColumnType("text")
                    .HasDefaultValueSql("('~/Public/Image/avt.png')");

                entity.Property(e => e.CustomerEmail)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.CustomerName)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.CustomerPassword)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.CustomerPhone)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.CustomerUserName)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Department>(entity =>
            {
                entity.ToTable("Department");

                entity.Property(e => e.Description).HasColumnType("text");

                entity.Property(e => e.Name)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<MyCompany>(entity =>
            {
                entity.ToTable("MyCompany");

                entity.Property(e => e.Address)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Description).IsUnicode(false);

                entity.Property(e => e.Image).HasColumnType("text");

                entity.Property(e => e.MyMission).HasColumnType("ntext");

                entity.Property(e => e.MyTarget).HasColumnType("ntext");

                entity.Property(e => e.MyVision).HasColumnType("ntext");

                entity.Property(e => e.TaxIdentificationNumber)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.Title)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Order>(entity =>
            {
                entity.Property(e => e.OrderDateCreate)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.OrderDescription).HasColumnType("text");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Orders)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK__Orders__Customer__5F492382");
            });

            modelBuilder.Entity<OrderDetail>(entity =>
            {
                entity.ToTable("OrderDetail");

                entity.Property(e => e.OrderDetailDateEnd).HasColumnType("datetime");

                entity.Property(e => e.OrderDetailDateStart).HasColumnType("datetime");

                entity.HasOne(d => d.Derpartment)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.DerpartmentId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_OrderDetail_Department");

                entity.HasOne(d => d.Orders)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.OrdersId)
                    .HasConstraintName("FK__OrderDeta__Order__6319B466");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.OrderDetails)
                    .HasForeignKey(d => d.ServiceId)
                    .HasConstraintName("FK__OrderDeta__Servi__6225902D");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.ToTable("Role");

                entity.HasIndex(e => e.Role1, "UQ__Role__DA15413EF4AE4BF6")
                    .IsUnique();

                entity.Property(e => e.Role1)
                    .HasMaxLength(255)
                    .IsUnicode(false)
                    .HasColumnName("Role");
            });

            modelBuilder.Entity<Service>(entity =>
            {
                entity.ToTable("Service");

                entity.Property(e => e.ServiceDescription).HasColumnType("text");

                entity.Property(e => e.ServiceImage).HasColumnType("text");

                entity.Property(e => e.ServiceName)
                    .HasMaxLength(255)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<StaffOrderDetail>(entity =>
            {
                entity.ToTable("StaffOrderDetail");

                entity.Property(e => e.DateEnd).HasColumnType("datetime");

                entity.Property(e => e.DateStart).HasColumnType("datetime");

                entity.HasOne(d => d.OrderDetail)
                    .WithMany(p => p.StaffOrderDetails)
                    .HasForeignKey(d => d.OrderDetailId)
                    .HasConstraintName("FK__Staff_Ord__Order__7720AD13");

                entity.HasOne(d => d.Staff)
                    .WithMany(p => p.StaffOrderDetails)
                    .HasForeignKey(d => d.StaffId)
                    .HasConstraintName("FK__Staff_Ord__Staff__762C88DA");
            });

            modelBuilder.Entity<UserInFo>(entity =>
            {
                entity.ToTable("UserInFo");

                entity.Property(e => e.Role)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.UserAddress)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.UserAvatar)
                    .HasColumnType("text")
                    .HasDefaultValueSql("('~/Public/Image/avt.png')");

                entity.Property(e => e.UserEmail)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.UserFullName)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.UserName)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.UserPassword)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.UserPhone)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.RoleNavigation)
                    .WithMany(p => p.UserInFos)
                    .HasPrincipalKey(p => p.Role1)
                    .HasForeignKey(d => d.Role)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_UserInFo_Role");
            });

            modelBuilder.Entity<staff>(entity =>
            {
                entity.ToTable("Staff");

                entity.Property(e => e.StaffAddress)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.StaffAvatar).HasColumnType("text");

                entity.Property(e => e.StaffEmail)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.StaffFullName)
                    .HasMaxLength(255)
                    .IsUnicode(false);

                entity.Property(e => e.StaffPhone)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.HasOne(d => d.Department)
                    .WithMany(p => p.staff)
                    .HasForeignKey(d => d.DepartmentId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_Staff_Department");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.staff)
                    .HasForeignKey(d => d.ServiceId)
                    .HasConstraintName("FK__Staff__ServiceId__49C3F6B7");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
