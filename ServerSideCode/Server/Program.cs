using BLL.BLLApi;
using BLL.BLLImplementation;
using DAL.DALApi;
using DAL.DALImplementation;
using DAL.DALModels;
using DataAccess;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);
builder.Services.AddControllers();

builder.Services.AddScoped<IRegionRepoB, RegionRepoB>();
builder.Services.AddScoped<ITownRepoB, TownRepoB>();
builder.Services.AddScoped<IPictureRepoD, PictureRepoD>();
builder.Services.AddScoped<ICottagePageD, CottagePageD>();
builder.Services.AddScoped<ICottageTableD, CottageTableD>();
builder.Services.AddCors(options =>
{
    options.AddPolicy("CORSPolicy",
        builder =>
        {
            builder
            .AllowAnyMethod()
            .AllowAnyHeader()
            .AllowAnyOrigin();
        });
});


DBActions actions = new DBActions(builder.Configuration);
var connString = actions.GetConnectionString("CottagesDB");
builder.Services.AddDbContext<CottagesContext>(options => options.UseSqlServer(connString));


var app = builder.Build();

app.UseCors("CORSPolicy");
app.MapControllers();

app.Run();





