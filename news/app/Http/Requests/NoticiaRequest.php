<?php


namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class NoticiaRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\Rule|array|string>
     */
    public function rules(): array
    {
        return [
          'titulo' => 'required',
          'texto' => 'required',
          'data' => 'required',
          'categoria_id' => 'required|exists:categoria,id',
          'autor_id' => 'required|exists:autor,id',
        ];
    }

    public function messages(): array
    {
        return [
            'titulo.required' => 'O campo título é requerido',
            'texto.required' => 'O campo texto é requerido',
            'data.required' => 'O campo data é requerido',
            'autor_id.required' => 'O campo autor é requerido',
            'categoria_id.required' => 'O campo categoria é requerido',
            'autor_id.exists' => 'Não foi encontrado o autor',
            'categoria_id.exists' => 'Não foi encontrada a categoria',
        ];
    }
}
