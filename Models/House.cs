namespace sharpList.Models;


public class House
{
  public int Id { get; set; }
  public int? Year { get; set; }
  public double? Price { get; set; }
  public string Color { get; set; }
  public string Description { get; set; }
  public string Bathrooms { get; set; }
  public string Bedrooms { get; set; }

  public DateTime CreatedAt { get; set; }
  public DateTime UpdatedAt { get; set; }
}