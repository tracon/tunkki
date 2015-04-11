module.exports = (robot) ->
  robot.on "github-repo-event", (res) ->
    Payload = res.payload
    channel = "#mansecon.tekniikka"
    switch(res.eventType)
      when "commit_comment"
        comment = Payload.comment
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: Comment to commit #{comment.commit_id}: #{comment.body}"
      when "create"
        type = Payload.ref_type
        what = Payload.ref
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: New #{type} was created: #{what}"
      when "delete"
        type = Payload.ref_type
        what = Payload.ref
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: #{type} was deleted: #{what}"
      when "fork"
        fork = Payload.forkee
        repo = Payload.repository
        robot.messageRoom channel, "New fork! #{repo.name} was forked by #{fork.owner.login}."
      when "issue_comment"
        action = Payload.action
        issue = Payload.issue
        comment = Payload.comment
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: New comment to issue #{issue.title}; #{comment.body}"
      when "issues"
        action = Payload.action
        issue = Payload.issue
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: Issue #{issue.title} was #{action}."
      when "member"
        action = Payload.action
        member = Payload.member
        repo = Payload.repository
        robot.messageRoom channel, "#{repo.name}: #{member.login} was #{action}."
      when "membership"
        action = Payload.action
        member = Payload.member
        team = Payload.team
        robot.messageRoom channel, "#{member.login} was #{action} from/to team #{team.name}"
      when "push"
        ref = Payload.ref.split "/"
        size = Payload.commits.length
        commits = Payload.commits
        repo = Payload.repository
        compare = Payload.compare
        if commits.length > 1
          latest = commits.length - 1
          robot.messageRoom channel, "#{repo.name}: #{size} commits pushed to #{ref[2]}. Latest commit message: '#{commits[latest].message}' Diff: #{compare}"
        else
          robot.messageRoom channel, "#{repo.name}: #{size} commit pushed to #{ref[2]}. Commit message: '#{commits[0].message}' Diff: #{compare}"
      when "repository"
        repo = Payload.repository
        robot.messageRoom channel, "New repository created: #{repo.name}"
      when "team_add"
        repo = Payload.repository
        team = Payload.team
        robot.messageRoom channel, "#{repo.name}: Added to the team #{team.name}"

