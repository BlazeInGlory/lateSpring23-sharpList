namespace sharpList.Services;

public class JobsService
{
  private readonly JobsRepository _repo;
  public JobsService(JobsRepository repo)
  {
    _repo = repo;
  }

  internal Job CreateJob(Job jobData)
  {
    Job job = _repo.CreateJob(jobData);
    return job;
  }

  internal List<Job> GetAllJobs()
  {
    List<Job> jobs = _repo.GetAllJobs();
    return jobs;
  }

  internal Job GetById(int jobId)
  {
    Job job = _repo.GetById(jobId);
    if (job == null) throw new Exception($"No Job at Id: {jobId}");
    return job;
  }

  internal string RemoveJob(int jobId)
  {
    Job job = GetById(jobId);
    int rows = _repo.RemoveJob(jobId);
    if (rows > 1) throw new Exception("Not gonna happen, bubba");
    return $"Deleted...";
  }

  internal Job UpdateJob(Job updateData)
  {
    Job original = GetById(updateData.Id);
    original.Type = updateData.Type != null ? updateData.Type : original.Type;
    original.Title = updateData.Title != null ? updateData.Title : original.Title;
    original.Hours = updateData.Hours != null ? updateData.Hours : original.Hours;
    original.Pay = updateData.Pay != null ? updateData.Hours : original.Hours;
    original.Description = updateData.Description != null ? updateData.Description : original.Description;
    return updateData;
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