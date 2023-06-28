namespace sharpList.Controllers;

[ApiController]
[Route("api/jobs")]
public class JobsController : ControllerBase
{
  private readonly JobsService _jobsService;
  public JobsController(JobsService jobsService)
  {
    _jobsService = jobsService;
  }

  [HttpGet]
  public ActionResult<List<Job>> GetAllJobs()
  {
    try
    {
      List<Job> jobs = _jobsService.GetAllJobs();
      return Ok(jobs);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }

  [HttpGet("jobId")]
  public ActionResult<Job> GetById(int jobId)
  {
    try
    {
      Job job = _jobsService.GetById(jobId);
      return Ok(job);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }

  [HttpPost]
  public ActionResult<Job> CreateJob([FromBody] Job jobData)
  {
    try
    {
      Job job = _jobsService.CreateJob(jobData);
      return Ok(job);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }

  [HttpDelete("{jobId}")]
  public ActionResult<string> RemoveJob(int jobId)
  {
    try
    {
      string message = _jobsService.RemoveJob(jobId);
      return Ok(message);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }

  [HttpPut("{jobId}")]
  public ActionResult<Job> UpdateJob(int jobId, [FromBody] Job updateData)
  {
    try
    {
      updateData.Id = jobId;
      Job job = _jobsService.UpdateJob(updateData);
      return Ok(job);
    }
    catch (Exception e)
    {
      return BadRequest(e.Message);
    }
  }
}