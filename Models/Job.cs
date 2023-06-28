namespace sharpList.Models;

public class Job
{
  public int Id { get; set; }
  public int? Type { get; set; }
  public int? Title { get; set; }
  public double? Pay { get; set; }
  public double? Hours { get; set; }
  public string Description { get; set; }
  public DateTime CreatedAt { get; set; }
  public DateTime UpdatedAt { get; set; }
}

// type,
// title,
// pay,
// hours,
// description