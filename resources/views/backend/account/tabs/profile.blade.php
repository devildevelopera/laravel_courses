<div class="table-responsive">
    <table class="table table-striped table-hover table-bordered">
        <tr>
            <th>@lang('labels.frontend.user.profile.avatar')</th>
            <td><img src="{{ $user->picture }}" height="100px" class="user-profile-image" /></td>
        </tr>
        <tr>
            <th>@lang('labels.frontend.user.profile.name')</th>
            <td>{{ $user->name }}</td>
        </tr>
        <tr>
            <th>@lang('labels.frontend.user.profile.email')</th>
            <td>{{ $user->email }}</td>
        </tr>
        @if($logged_in_user->hasRole('teacher'))
        <tr>
            <th>@lang('labels.backend.access.users.tabs.content.overview.status')</th>
            <td>{!! $logged_in_user->status_label !!}</td>
        </tr>
        @endif

        <tr>
            <th>@lang('labels.frontend.user.profile.created_at')</th>
            <td>{{ timezone()->convertToLocal($user->created_at) }} ({{ $user->created_at->diffForHumans() }})</td>
        </tr>
        <tr>
            <th>@lang('labels.frontend.user.profile.last_updated')</th>
            <td>{{ timezone()->convertToLocal($user->updated_at) }} ({{ $user->updated_at->diffForHumans() }})</td>
        </tr>
        @if(config('registration_fields') != NULL)
            @php
                $fields = json_decode(config('registration_fields'));
            @endphp
            @foreach($fields as $item)
                <tr>
                    <th>{{__('labels.backend.general_settings.user_registration_settings.fields.'.$item->name)}}</th>
                    <td>{{$user[$item->name]}}</td>
                </tr>
            @endforeach
        @endif
    </table>
</div>
