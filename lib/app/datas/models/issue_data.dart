class IssueData {
  String? url;
  String? repositoryUrl;
  String? labelsUrl;
  String? commentsUrl;
  String? eventsUrl;
  String? htmlUrl;
  int? id;
  String? nodeId;
  int? number;
  String? title;
  User? user;
  List<Labels>? labels;
  String? state;
  bool? locked;
  User? assignee;
  List<User>? assignees;
  dynamic? milestone;
  int? comments;
  String? createdAt;
  String? updatedAt;
  dynamic? closedAt;
  String? authorAssociation;
  dynamic? activeLockReason;
  bool? draft;
  PullRequest? pullRequest;
  String? body;
  dynamic? closedBy;
  Reactions? reactions;
  String? timelineUrl;
  dynamic? performedViaGithubApp;
  dynamic? stateReason;

  IssueData(
      {this.url,
        this.repositoryUrl,
        this.labelsUrl,
        this.commentsUrl,
        this.eventsUrl,
        this.htmlUrl,
        this.id,
        this.nodeId,
        this.number,
        this.title,
        this.user,
        this.labels,
        this.state,
        this.locked,
        this.assignee,
        this.assignees,
        this.milestone,
        this.comments,
        this.createdAt,
        this.updatedAt,
        this.closedAt,
        this.authorAssociation,
        this.activeLockReason,
        this.draft,
        this.pullRequest,
        this.body,
        this.closedBy,
        this.reactions,
        this.timelineUrl,
        this.performedViaGithubApp,
        this.stateReason});

  IssueData.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    repositoryUrl = json['repository_url'];
    labelsUrl = json['labels_url'];
    commentsUrl = json['comments_url'];
    eventsUrl = json['events_url'];
    htmlUrl = json['html_url'];
    id = json['id'];
    nodeId = json['node_id'];
    number = json['number'];
    title = json['title'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    if (json['labels'] != null) {
      labels = <Labels>[];
      json['labels'].forEach((v) {
        labels!.add(Labels.fromJson(v));
      });
    }
    state = json['state'];
    locked = json['locked'];
    assignee = json['assignee'] != null ? User.fromJson(json['assignee']) : null; // Handle this
    assignees = json['assignees'] != null
        ? (json['assignees'] as List).map((v) => User.fromJson(v)).toList()
        : null;
    milestone = json['milestone'];
    comments = json['comments'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    closedAt = json['closed_at'];
    authorAssociation = json['author_association'];
    activeLockReason = json['active_lock_reason'];
    draft = json['draft'];
    pullRequest = json['pull_request'] != null
        ? PullRequest.fromJson(json['pull_request'])
        : null;
    body = json['body'];
    closedBy = json['closed_by'];
    reactions = json['reactions'] != null
        ? Reactions.fromJson(json['reactions'])
        : null;
    timelineUrl = json['timeline_url'];
    performedViaGithubApp = json['performed_via_github_app'];
    stateReason = json['state_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['repository_url'] = repositoryUrl;
    data['labels_url'] = labelsUrl;
    data['comments_url'] = commentsUrl;
    data['events_url'] = eventsUrl;
    data['html_url'] = htmlUrl;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['number'] = number;
    data['title'] = title;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (labels != null) {
      data['labels'] = labels!.map((v) => v.toJson()).toList();
    }
    data['state'] = state;
    data['locked'] = locked;
    data['assignee'] = assignee;
    if (assignees != null) {
      data['assignees'] = assignees!.map((v) => v?.toJson()).toList();
    } else {
      data['assignees'] = [];
    }
    data['milestone'] = milestone;
    data['comments'] = comments;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['closed_at'] = closedAt;
    data['author_association'] = authorAssociation;
    data['active_lock_reason'] = activeLockReason;
    data['draft'] = draft;
    if (pullRequest != null) {
      data['pull_request'] = pullRequest!.toJson();
    }
    data['body'] = body;
    data['closed_by'] = closedBy;
    if (reactions != null) {
      data['reactions'] = reactions!.toJson();
    }
    data['timeline_url'] = timelineUrl;
    data['performed_via_github_app'] = performedViaGithubApp;
    data['state_reason'] = stateReason;
    return data;
  }
}

class User {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;

  User(
      {this.login,
        this.id,
        this.nodeId,
        this.avatarUrl,
        this.gravatarId,
        this.url,
        this.htmlUrl,
        this.followersUrl,
        this.followingUrl,
        this.gistsUrl,
        this.starredUrl,
        this.subscriptionsUrl,
        this.organizationsUrl,
        this.reposUrl,
        this.eventsUrl,
        this.receivedEventsUrl,
        this.type,
        this.siteAdmin});

  User.fromJson(Map<String, dynamic> json) {
    login = json['login'];
    id = json['id'];
    nodeId = json['node_id'];
    avatarUrl = json['avatar_url'];
    gravatarId = json['gravatar_id'];
    url = json['url'];
    htmlUrl = json['html_url'];
    followersUrl = json['followers_url'];
    followingUrl = json['following_url'];
    gistsUrl = json['gists_url'];
    starredUrl = json['starred_url'];
    subscriptionsUrl = json['subscriptions_url'];
    organizationsUrl = json['organizations_url'];
    reposUrl = json['repos_url'];
    eventsUrl = json['events_url'];
    receivedEventsUrl = json['received_events_url'];
    type = json['type'];
    siteAdmin = json['site_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['gists_url'] = gistsUrl;
    data['starred_url'] = starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    return data;
  }
}

class Labels {
  int? id;
  String? nodeId;
  String? url;
  String? name;
  String? color;
  bool? isDefault;
  String? description;

  Labels(
      {this.id,
        this.nodeId,
        this.url,
        this.name,
        this.color,
        this.isDefault,
        this.description});

  Labels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nodeId = json['node_id'];
    url = json['url'];
    name = json['name'];
    color = json['color'];
    isDefault = json['default'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['node_id'] = nodeId;
    data['url'] = url;
    data['name'] = name;
    data['color'] = color;
    data['default'] = isDefault;
    data['description'] = description;
    return data;
  }
}

class PullRequest {
  String? url;
  String? htmlUrl;
  String? diffUrl;
  String? patchUrl;
  String? mergedAt;

  PullRequest({this.url, this.htmlUrl, this.diffUrl, this.patchUrl, this.mergedAt});

  PullRequest.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    htmlUrl = json['html_url'];
    diffUrl = json['diff_url'];
    patchUrl = json['patch_url'];
    mergedAt = json['merged_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['diff_url'] = diffUrl;
    data['patch_url'] = patchUrl;
    data['merged_at'] = mergedAt;
    return data;
  }
}

class Reactions {
  String? url;
  int? totalCount;
  int? plusOne; // Renamed
  int? minusOne; // Renamed
  int? laugh;
  int? hooray;
  int? confused;
  int? heart;
  int? rocket;
  int? eyes;

  Reactions(
      {this.url,
        this.totalCount,
        this.plusOne,
        this.minusOne,
        this.laugh,
        this.hooray,
        this.confused,
        this.heart,
        this.rocket,
        this.eyes});

  Reactions.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    totalCount = json['total_count'];
    plusOne = json['+1'];
    minusOne = json['-1'];
    laugh = json['laugh'];
    hooray = json['hooray'];
    confused = json['confused'];
    heart = json['heart'];
    rocket = json['rocket'];
    eyes = json['eyes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['total_count'] = totalCount;
    data['+1'] = plusOne;
    data['-1'] = minusOne;
    data['laugh'] = laugh;
    data['hooray'] = hooray;
    data['confused'] = confused;
    data['heart'] = heart;
    data['rocket'] = rocket;
    data['eyes'] = eyes;
    return data;
  }
}
