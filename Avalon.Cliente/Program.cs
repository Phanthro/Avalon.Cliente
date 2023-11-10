using MediatR;
using DA = DataAccess;
using Microsoft.AspNetCore.Mvc.ApiExplorer;
using Avalon.ClienteService.Repositories.Interfaces;
using Avalon.ClienteService.Repositories;
using Avalon.ClienteService.Misc.Extensions;
using Microsoft.Extensions.Configuration;

var builder = WebApplication.CreateBuilder(args);


// Configure the API versioning properties of the project. 
builder.Services.AddApiVersioningConfigured();

// Add a Swagger generator and Automatic Request and Response annotations:
builder.Services.AddSwaggerSwashbuckleConfigured();
builder.Configuration
    .SetBasePath(builder.Environment.ContentRootPath)
    .AddJsonFile("secrets/appsettings.json", optional: true);

builder.Services.AddCors(p => p.AddPolicy("corsapp", builder =>
    {
        builder.WithOrigins("*").AllowAnyMethod().AllowAnyHeader();
    }));
//services

var services = builder.Services;

services /**/
    .AddTransient<DA.IDataAccess, DA.DataAccess>()
    .AddTransient<IClienteRepository, ClienteRepository>()
    .AddTransient<IFaleConoscoRepository, FaleConoscoRepository>()
    ;

services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
services.AddMediatR(typeof(Program));
services.AddControllers();
services.AddEndpointsApiExplorer();
services.AddSwaggerGen();


var app = builder.Build();

app.UseSwagger();

var descriptionProvider = app.Services.GetRequiredService<IApiVersionDescriptionProvider>();
app.UseSwaggerUI(c =>
        {
            foreach (var description in descriptionProvider.ApiVersionDescriptions)
            {
                c.SwaggerEndpoint($"{description.GroupName}/swagger.json", description.GroupName.ToUpperInvariant());
            }
        });

app.UseHttpsRedirection();

app.UseAuthorization();
app.UseCors("corsapp");

app.MapControllers();

app.Run();
