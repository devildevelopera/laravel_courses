{{ html()->modelForm($logged_in_user, 'PATCH', route('admin.profile.update'))->class('form-horizontal')->attribute('enctype', 'multipart/form-data')->open() }}
<div class="row">
    <div class="col">
        <div class="form-group">
            {{ html()->label(__('validation.attributes.frontend.avatar'))->for('avatar') }}

            <div>
                <input type="radio" name="avatar_type"
                       value="gravatar" {{ $logged_in_user->avatar_type == 'gravatar' ? 'checked' : '' }} /> {{__('validation.attributes.frontend.gravatar')}}
                &nbsp;&nbsp;
                <input type="radio" name="avatar_type"
                       value="storage" {{ $logged_in_user->avatar_type == 'storage' ? 'checked' : '' }} /> {{__('validation.attributes.frontend.upload')}}

                @foreach($logged_in_user->providers as $provider)
                    @if(strlen($provider->avatar))
                        <input type="radio" name="avatar_type"
                               value="{{ $provider->provider }}" {{ $logged_in_user->avatar_type == $provider->provider ? 'checked' : '' }} /> {{ ucfirst($provider->provider) }}
                    @endif
                @endforeach
            </div>
        </div><!--form-group-->

        <div class="form-group hidden" id="avatar_location">
            {{ html()->file('avatar_location')->class('form-control') }}
        </div><!--form-group-->

    </div><!--col-->
</div><!--row-->

<div class="row">
    <div class="col">
        <div class="form-group">
            {{ html()->label(__('validation.attributes.frontend.first_name'))->for('first_name') }}

            {{ html()->text('first_name')
                ->class('form-control')
                ->placeholder(__('validation.attributes.frontend.first_name'))
                ->attribute('maxlength', 191)
                ->required()
                ->autofocus() }}
        </div><!--form-group-->
    </div><!--col-->
</div><!--row-->

<div class="row">
    <div class="col">
        <div class="form-group">
            {{ html()->label(__('validation.attributes.frontend.last_name'))->for('last_name') }}

            {{ html()->text('last_name')
                ->class('form-control')
                ->placeholder(__('validation.attributes.frontend.last_name'))
                ->attribute('maxlength', 191)
                ->required() }}
        </div><!--form-group-->
    </div><!--col-->
</div><!--row-->
@if($logged_in_user->hasRole('teacher'))

@endif
@if ($logged_in_user->canChangeEmail())
    <div class="row">
        <div class="col">
            <div class="alert alert-info">
                <i class="fas fa-info-circle"></i> @lang('strings.frontend.user.change_email_notice')
            </div>

            <div class="form-group">
                {{ html()->label(__('validation.attributes.frontend.email'))->for('email') }}

                {{ html()->email('email')
                    ->class('form-control')
                    ->placeholder(__('validation.attributes.frontend.email'))
                    ->attribute('maxlength', 191)
                    ->required() }}
            </div><!--form-group-->
        </div><!--col-->
    </div><!--row-->
@endif
@if(config('registration_fields') != NULL)
    @php
        $fields = json_decode(config('registration_fields'));
        $inputs = ['text','number','date'];
    @endphp


    @foreach($fields as $item)
        <div class="row">
            <div class="col">
                <div class="form-group">
                    @if(in_array($item->type,$inputs))
                        {{ html()->label(__('labels.backend.general_settings.user_registration_settings.fields.'.$item->name))->for('last_name') }}

                        <input type="{{$item->type}}" class="form-control mb-0" value="{{$logged_in_user[$item->name]}}"
                               name="{{$item->name}}"
                               placeholder="{{__('labels.backend.general_settings.user_registration_settings.fields.'.$item->name)}}">
                    @elseif($item->type == 'gender')
                        <label class="radio-inline mr-3 mb-0">
                            <input type="radio" @if($logged_in_user[$item->name] == 'male') checked
                                   @endif name="{{$item->name}}"
                                   value="male"> {{__('validation.attributes.frontend.male')}}
                        </label>
                        <label class="radio-inline mr-3 mb-0">
                            <input type="radio" @if($logged_in_user[$item->name] == 'female') checked
                                   @endif  name="{{$item->name}}"
                                   value="female"> {{__('validation.attributes.frontend.female')}}
                        </label>
                        <label class="radio-inline mr-3 mb-0">
                            <input type="radio" @if($logged_in_user[$item->name] == 'other') checked
                                   @endif  name="{{$item->name}}"
                                   value="other"> {{__('validation.attributes.frontend.other')}}
                        </label>
                    @elseif($item->type == 'textarea')
                        <textarea name="{{$item->name}}"
                                  placeholder="{{__('labels.backend.general_settings.user_registration_settings.fields.'.$item->name)}}"
                                  class="form-control mb-0">{{$logged_in_user[$item->name]}}</textarea>
                    @endif
                </div>
            </div>
        </div>
    @endforeach

@endif
<div class="row">
    <div class="col">
        <div class="form-group mb-0 clearfix">
            {{ form_submit(__('labels.general.buttons.update')) }}
        </div><!--form-group-->
    </div><!--col-->
</div><!--row-->
{{ html()->closeModelForm() }}

@push('after-scripts')
    <script>
        $(function () {
            var avatar_location = $("#avatar_location");

            if ($('input[name=avatar_type]:checked').val() === 'storage') {
                avatar_location.show();
            } else {
                avatar_location.hide();
            }

            $('input[name=avatar_type]').change(function () {
                if ($(this).val() === 'storage') {
                    avatar_location.show();
                } else {
                    avatar_location.hide();
                }
            });
        });
        $(document).on('change', '#payment_method', function(){
            if($(this).val() === 'bank'){
                $('.paypal_details').hide();
                $('.bank_details').show();
            }else{
                $('.paypal_details').show();
                $('.bank_details').hide();
            }
        });
    </script>
@endpush
