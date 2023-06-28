namespace sharpList.Repositories;

public class JobsRepository
{
  private readonly IDbConnection _db;
  public JobsRepository(IDbConnection db)
  {
    _db = db;
  }

  internal Job CreateJob(Job jobData)
  {
    string sql = @"
    INSERT INTO jobs
    (type, title, pay, hours, description)
    VALUES
    (@type, @title, @pay, @hours, @description);
    SELECT * FROM jobs WHERE id = LAST_INSERT_ID();";
    Job job = _db.Query<Job>(sql, jobData).FirstOrDefault();
    return job;
  }

  internal List<Job> GetAllJobs()
  {
    string sql = "SELECT * FROM jobs ORDER BY createdAt DESC;";
    List<Job> jobs = _db.Query<Job>(sql).ToList();
    return jobs;
  }

  internal Job GetById(int jobId)
  {
    string sql = "SELECT * FROM jobs WHERE id = @jobId;";
    Job job = _db.Query<Job>(sql, new { jobId }).FirstOrDefault();
    return job;
  }

  internal int RemoveJob(int jobId)
  {
    string sql = "DELETE FROM jobs WHERE id = @jobId LIMIT 1;";
    int rows = _db.Execute(sql, new { jobId });
    return rows;
  }

  internal void UpdateJob(Job updateData)
  {
    string sql = @"
    UPDATE jobs SET
    type = @type,
    title = @title,
    pay = @pay,
    hours = @hours,
    description = @description
    WHERE id = @id;";
    _db.Execute(sql, updateData);
  }
}

// public int Id { get; set; }
// public int Type { get; set; }
// public int Title { get; set; }
// public double? Pay { get; set; }
// public double? Hours { get; set; }
// public string Description { get; set; }
// public DateTime CreatedAt { get; set; }
// public DateTime UpdatedAt { get; set; }