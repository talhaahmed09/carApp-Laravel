<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return false;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
       return [
                  'first_name' => 'required|string|max:255',
        'last_name' => 'required|string|max:255',
        'birthday' => 'required',
         'email' => ['required', Rule::unique('users')->ignore($this->user)],
        'mobile' => 'required',
         'country' => 'required',
        'city' => 'required',
        'role' => 'required',
        'company_id' => 'required',
        'password' => 'required|string|min:8|confirmed',
            ];
    }
}
